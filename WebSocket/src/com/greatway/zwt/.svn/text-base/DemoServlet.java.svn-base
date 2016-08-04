package com.greatway.zwt;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.StreamInbound;
import org.apache.catalina.websocket.WebSocketServlet;
import org.apache.catalina.websocket.WsOutbound;

public class DemoServlet extends WebSocketServlet {

	private static List<MyMessageInbound> list = new ArrayList<MyMessageInbound>();
	@Override
	protected StreamInbound createWebSocketInbound(String arg0,
			HttpServletRequest arg1) {
		// TODO Auto-generated method stub
		return new MyMessageInbound();
	}

	public class MyMessageInbound extends MessageInbound{

		@Override
		protected void onBinaryMessage(ByteBuffer arg0) throws IOException {
			// TODO Auto-generated method stub
			
		}

		WsOutbound myoutbound;

        @Override
        public void onOpen(WsOutbound outbound) {
            try {
                this.myoutbound = outbound;
                list.add(this);
                outbound.writeTextMessage(CharBuffer.wrap("Hello!"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        @Override
        public void onClose(int status) {
            list.remove(this);
        }

		
		@Override
		protected void onTextMessage(CharBuffer cb) throws IOException {
			// TODO Auto-generated method stub
			for(MyMessageInbound mmib : list){
				CharBuffer buffer = CharBuffer.wrap(cb);
                mmib.myoutbound.writeTextMessage(buffer);
                mmib.myoutbound.flush();
			}
		}
		
	}

	
}