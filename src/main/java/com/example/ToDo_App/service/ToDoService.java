package com.example.ToDo_App.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.ToDo_App.model.ToDo;
import com.example.ToDo_App.repo.IToDoRepo;

@Service
public class ToDoService {
	@Autowired
	IToDoRepo repo;

	public List<ToDo> getAllToDoItems() {
		ArrayList<ToDo> todolist = new ArrayList<>();
		repo.findAll().forEach(todo -> todolist.add(todo));
		return todolist;
	}

	// Sửa dùng orElse(null) thay vì .get() để tránh bị sập app nếu không tìm thấy
	// ID
	public ToDo getToDoItemById(Long id) {
		return repo.findById(id).orElse(null);
	}

	public boolean updateStatus(Long id) {
		ToDo todo = getToDoItemById(id);
		if (todo != null) {
			todo.setStatus("Completed");
			return saveOrUpdateToDoItem(todo);
		}
		return false;
	}

	public boolean saveOrUpdateToDoItem(ToDo todo) {
		ToDo updateObj = repo.save(todo);
		return updateObj != null && updateObj.getId() != null;
	}

	// Sửa dùng try-catch để kiểm tra xóa thành công đơn giản và an toàn
	public boolean deleteToDoItem(Long id) {
		try {
			repo.deleteById(id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}