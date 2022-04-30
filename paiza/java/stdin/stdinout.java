import java.io.ByteArrayOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;

	class MyInputStream extends InputStream {
		private StringBuilder sb = new StringBuilder();

		public String typeLine(String str){
			return sb.append(str).append(System.getProperty("line separator")).toString();
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


