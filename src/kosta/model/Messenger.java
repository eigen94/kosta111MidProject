package kosta.model;

import java.io.Serializable;

public class Messenger implements Serializable{
	private int msg_id;
	private String msg_content;
	private int msg_sender;
	private int msg_projectid;
	private int msg_lastMsgId;
	private int msg_startIndex;
	public int getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(int msg_id) {
		this.msg_id = msg_id;
	}
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
	public int getMsg_lastMsgId() {
		return msg_lastMsgId;
	}
	public void setMsg_lastMsgId(int msg_lastMsgId) {
		this.msg_lastMsgId = msg_lastMsgId;
	}
	public int getMsg_startIndex() {
		return msg_startIndex;
	}
	public void setMsg_startIndex(int msg_startIndex) {
		this.msg_startIndex = msg_startIndex;
	}
	@Override
	public String toString() {
		return "Messenger [msg_id=" + msg_id + ", msg_content=" + msg_content
				+ ", msg_sender=" + msg_sender + ", msg_projectid="
				+ msg_projectid + ", msg_lastMsgId=" + msg_lastMsgId
				+ ", msg_startIndex=" + msg_startIndex + "]";
	}
	
	
}
