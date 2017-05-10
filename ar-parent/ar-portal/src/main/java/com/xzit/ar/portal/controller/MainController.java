/**
 * @Title: ManageController.java
 * @Package com.xzit.ar.portal.controller
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月14日 下午2:05:32
 * @version V1.0
 */
package com.xzit.ar.portal.controller;

import com.xzit.ar.common.constant.PathConstant;
import com.xzit.ar.common.exception.UtilException;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.common.util.IOUtil;
import org.aspectj.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xzit.ar.common.base.BaseController;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @author Mr.Black
 * @ClassName: ManageController
 * @Description: TODO MainController
 * @date 2016年1月14日 下午2:05:32
 */
@Controller
@RequestMapping("")
public class MainController extends BaseController {

    @RequestMapping("/index")
    public String index() {
        return "portal-main/index";
    }

    /**
     * TODO 下载文件
     *
     * @param response
     * @param fileRelPath
     * @param fileName
     * @return
     * @throws UtilException
     */
    @RequestMapping("/download")
    public String download(HttpServletResponse response, String fileRelPath, String fileName) throws UtilException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition",
                "attachment;fileName=" + IOUtil.createFileName(fileName));

        // 读取文件
        try {
            File file = new File(PathConstant.contextAbsolutePath + fileRelPath);
            InputStream inputStream = new FileInputStream(file);
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[1024];
            int length;
            while ((length = inputStream.read(b)) > 0) {
                os.write(b, 0, length);
            }
            inputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
