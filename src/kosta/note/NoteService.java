package kosta.note;

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

}
