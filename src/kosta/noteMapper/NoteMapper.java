package kosta.noteMapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import kosta.model.Note;
import kosta.model.Search;


public interface NoteMapper {

	public int insertNote(Note note);

	public List<Note> listNote();

	public List<Note> selectNote(int n_id);

	public List<String> searchId(String id);

	public int getEmail(String receive);

	public List<Note> noteList(RowBounds startRow, Search search);

	public int countNote(Search search);

	public String noteDetail(int  n_id);
	

}
