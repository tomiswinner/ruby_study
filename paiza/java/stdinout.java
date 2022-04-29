import java.io.ByteArrayOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;

public class SystemInOutMain{
	public static void main(String [] args)throws InterruptedException {
		InputStream orgIn = System.in;

		class MyInputStream extends InputStream {
			private StringBuilder sb = new StringBuilder();

			public String typeLine(String str){
				return sb.append(str).append(System.getProperty("line separator"));
			}

			@Override
			public int read(){
				if (sb.length() == 0){
					return -1;
				}
				int result = sb.charAt(0);
				sb.deleteCharAt(0);
				return result;
			}
		}

		MyInputStream myIn = new MyInputStream();
		System.setIn(myIn);
	 	myIn.typeLine("aidsofjsdlkjaf");
		System.out.println(myIn);

	}
}
