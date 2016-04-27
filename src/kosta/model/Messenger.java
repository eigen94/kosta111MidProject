package kosta.model;

public class Messenger {
	private String msg_content;
	private int msg_sender;
	private int msg_projectid;
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public int getMsg_sender() {
		return msg_sender;
	}
	public void setMsg_sender(int msg_sender) {
		this.msg_sender = msg_sender;
	}
	public int getMsg_projectid() {
		return msg_projectid;
	}
	public void setMsg_projectid(int msg_projectid) {
		this.msg_projectid = msg_projectid;
	}
	@Override
	public String toString() {
		return "Messenger [msg_content=" + msg_content
				+ ", msg_sender=" + msg_sender + ", msg_projectid="
				+ msg_projectid + "]";
	}
	
}
