/**  
* @Title: IOUtil.java <br>
* @Package com.xzit.ar.common.util <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月10日 下午8:23:32 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.common.util;

import java.io.*;

import org.apache.commons.io.IOUtils;

import com.xzit.ar.common.exception.ExceptionCode;
import com.xzit.ar.common.exception.UtilException;

/**
 * @ClassName: IOUtil <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2015年12月10日 下午8:23:32 <br>
 * @version V1.0 <br>
 *          <br>
 */
public final class IOUtil {

	public static void copyFileFromInputStream(String filePath, InputStream in) throws UtilException {
		copyFileFromInputStream(filePath, in, null);
	}

	/**
	 * 
	 * Description: <br>
	 * 
	 * @author yang.zhipeng <br>
	 * @taskId <br>
	 * @param filePath
	 *            <br>
	 * @param in
	 *            <br>
	 * @param charset
	 *            <br>
	 * @throws UtilException
	 *             <br>
	 */
	public static void copyFileFromInputStream(String filePath, InputStream in, String charset) throws UtilException {
		OutputStream out = null;
		try {
			out = new BufferedOutputStream(new FileOutputStream(filePath));

			int len = 0;
			byte[] temp = new byte[1024];
			while ((len = in.read(temp)) != -1) {
				out.write(temp, 0, len);
			}
			out.flush();
		} catch (Exception e) {
			throw new UtilException(ExceptionCode.WRITE_FILE_ERROR_10029, e);
		} finally {
			IOUtils.closeQuietly(out);
			IOUtils.closeQuietly(in);
		}
	}

	/**
	 * 
	 * Description: <br>
	 * 
	 * @author yang.zhipeng <br>
	 * @taskId <br>
	 * @param in
	 *            <br>
	 * @return <br>
	 * @throws UtilException
	 *             <br>
	 */
	public static String readString(InputStream in) throws UtilException {
		StringBuilder sb = new StringBuilder();
		BufferedReader reader = null;
		String line = null;
		try {
			reader = new BufferedReader(new InputStreamReader(in));
			while ((line = reader.readLine()) != null) {
				sb.append(line).append('\n');
			}
		} catch (Exception e) {
			throw new UtilException(ExceptionCode.READ_PARAM_ERROR_10027, e);
		} finally {
			IOUtils.closeQuietly(reader);
		}

		return sb.toString();
	}

	/**
	 * Description: readFile<br>
	 * 
	 * @author 王伟 <br>
	 * @param filePath
	 *            <br>
	 * @return <br>
	 * @throws IOException
	 *             <br>
	 */
	public static String readFile(String filePath) throws IOException {
		File file = new File(filePath);
		if (file.exists() && file.isFile()) {
			BufferedReader in = null;
			String line = null;
			try {
				in = new BufferedReader(new FileReader(file));
				StringBuilder sb = new StringBuilder();
				while ((line = in.readLine()) != null) {
					sb.append(line).append('\n');
				}
				return sb.toString();
			} catch (Exception e) {
				throw new IOException(e);
			} finally {
				IOUtils.closeQuietly(in);
			}

		}
		return null;
	}

	/**
	 * 
	 * Description: <br>
	 * 
	 * @author yang.zhipeng <br>
	 * @taskId <br>
	 * @param content
	 *            <br>
	 * @param file
	 *            <br>
	 * @throws UtilException
	 *             <br>
	 */
	public static void writeFile(byte[] content, File file) throws UtilException {
		if (file != null) {
			BufferedOutputStream out = null;
			try {
				out = new BufferedOutputStream(new FileOutputStream(file));
				out.write(content);
				out.flush();
			} catch (Exception e) {
				throw new UtilException(ExceptionCode.WRITE_FILE_ERROR_10029, e);
			} finally {
				IOUtils.closeQuietly(out);
			}
		}
	}

	/**
	 * Description: writeFile<br>
	 * 
	 * @author 王伟 <br>
	 * @param contents
	 *            <br>
	 * @param file
	 *            <br>
	 * @throws UtilException
	 *             <br>
	 */
	public static void writeFile(String contents, File file) throws UtilException {
		if (file != null) {
			BufferedWriter out = null;
			try {
				out = new BufferedWriter(new FileWriter(file));
				out.write(contents);
				out.flush();
			} catch (Exception e) {
				throw new UtilException(ExceptionCode.WRITE_FILE_ERROR_10029, e);
			} finally {
				IOUtils.closeQuietly(out);
			}
		}
	}

	/**
	 * @Title: createFileName
	 * @Description: TODO 下载文件时设置文件名称
	 */
	public static String createFileName(String name) throws UtilException {
		String newName = "";
		if (CommonUtil.isNotEmpty(name)) {
			try {
				newName = new String(name.getBytes("UTF-8"), "iso-8859-1");
			} catch (UnsupportedEncodingException e) {
				throw new UtilException("生成文件名时发生错误");
			}
		}
		return newName;
	}
}
