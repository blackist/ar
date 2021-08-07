package com.xzit.ar.common.util;

import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Description.
 *
 * @author dongliangliang
 * Created at 2021/8/7 12:44 下午
 * @version AsyncUtils v0.1
 */
public class AsyncUtils {

    /**
     * 一般IO类型任务CPU加速比为10, 这里保守一点设置为5
     */
    private static final int POOL_SIZE = Runtime.getRuntime().availableProcessors() * 2;

    /**
     * 最大等待时间(单位:毫秒)
     */
    private static final int MAX_WAIT_TIME = 150;

    /**
     * 接口平均RT(单位:毫秒)
     */
    private static final int AVG_RT = 15;

    /**
     * 任务队列大小
     */
    private static final int QUEUE_SIZE = POOL_SIZE * MAX_WAIT_TIME / AVG_RT * 2;

    public static final ExecutorService EXECUTORS = new ThreadPoolExecutor(POOL_SIZE, 60, 0,
        TimeUnit.MILLISECONDS, new LinkedBlockingQueue<>(QUEUE_SIZE),
        new NamedThreadFactory("ar_important", true), new ThreadPoolExecutor.CallerRunsPolicy());
}

class NamedThreadFactory implements ThreadFactory {

    private final AtomicInteger mThreadNum = new AtomicInteger(1);
    private final String mPrefix;
    private final boolean mDaemon;
    private final ThreadGroup mGroup;

    public NamedThreadFactory(String prefix, boolean daemon) {
        mPrefix = prefix + "-thread-";
        mDaemon = daemon;
        SecurityManager s = System.getSecurityManager();
        mGroup = (s == null) ? Thread.currentThread().getThreadGroup() : s.getThreadGroup();
    }

    @Override
    public Thread newThread(Runnable runnable) {
        String name = mPrefix + mThreadNum.getAndIncrement();
        Thread ret = new Thread(mGroup, runnable, name, 0);
        ret.setDaemon(mDaemon);
        return ret;
    }
}
