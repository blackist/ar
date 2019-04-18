import com.xzit.ar.common.constant.PathConstant;
import com.xzit.ar.common.exception.UtilException;
import com.xzit.ar.common.util.ImageUtil;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/9 11:45.
 */
public class TestImageUtil {

    @org.junit.Test
    public void testImageUtil() throws Exception {
//        MultipartFile image = (MultipartFile) new File("G:\\image\\12.jpg");
//        try {
            //ImageUtil.saveImage(image);

//        } catch (UtilException e) {
//            e.printStackTrace();
//        }
        File image = new File("G:/image/12.jpg");
        System.out.println(image.getName());

        Calendar date = Calendar.getInstance();
        SimpleDateFormat format1 = new SimpleDateFormat( "yyyy");
        SimpleDateFormat format2 = new SimpleDateFormat( "MM");
        SimpleDateFormat format3 = new SimpleDateFormat( "dd");
        String name1 = format1.format(date.getTime());
        String name2 = format2.format(date.getTime());
        String name3 = format3.format(date.getTime());
        System.out.println(name1 + "\n" + name2 + "\n" + name3);
        String dirDatePath = "/" + name1 + "/" + name2 + "/" + name3;
//        File file1 = new File( "D:/ "+name1);
//        File file2 = new File( "D:/ "+name1+"/"+name2);
        File file3 = new File( PathConstant.pictureUploadAbsolutePath + dirDatePath);
//        file1.mkdirs();
//        file2.mkdirs();
        file3.mkdirs();

    }
}
