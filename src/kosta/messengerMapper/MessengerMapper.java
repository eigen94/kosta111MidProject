package kosta.messengerMapper;

import java.util.List;

import kosta.model.Messenger;


public interface MessengerMapper {

	public int messengerInsert(Messenger messenger);
	public List<Messenger> loadMessege(Messenger Messenger);
	public int getMaxMsgId();
	public int deleteMessege(int p_id);
}
