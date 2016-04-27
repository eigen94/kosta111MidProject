package kosta.noteMapper;

import java.util.List;

import kosta.model.Note;


public interface noteMapper {

	public int insertNote(Note note);

	public List<Note> listNote();

	public List<Note> selectNote(int n_id);
	

}
