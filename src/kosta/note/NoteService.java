package kosta.note;

import java.util.List;

public class NoteService {
	public static NoteDao dao;
	public static NoteService service = new NoteService();
	public static NoteService getInsetance(){
		dao=NoteDao.getInstance();
		return service;
	}
	
	public int insertNoteService(Note note){
		return dao.insertNote(note);
	}
	
	
	public List<Note> selectNoteService(int n_id){
		return dao.selectNote(n_id);
	}

}
