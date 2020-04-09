package com.example.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Feedback;
import com.example.demo.entities.Question;

@Repository("questionRepository")
public interface QuestionRepository extends CrudRepository<Question, Integer>{
	public Iterable<Question> findAll();
	
	@Query("from Question where id = :id")
	public Question findByID(@Param("id") int id);
	
	@Query(value = "from Question where subject.id = :subject_id")
	public Iterable<Question> findAllBySubjectId(@Param("subject_id") int subjectID);
	
	@Query(value = "from Question where subject.id = :subject_id and status = :status")
	public Iterable<Question> findAllBySubjectIdAndStatus(@Param("subject_id") int subjectID, @Param("status") int status);
	
	@Query(value = "from Question where account.id = :acid and subject.id = :sjid")
	public Iterable<Question> findAllByAccountIdAndSubjectID(@Param("acid") int accountID,@Param("sjid") int subjectID);
	
	@Query(value = "from Question where account.id = :acid and subject.id = :sjid and status= :status")
	public Iterable<Question> findAllByAccountIdAndSubjectIDAndStatus(@Param("acid") int accountID,@Param("sjid") int subjectID, @Param("status") int status);
	
	@Query(value = "from Question where account.id = :id and status= :status")
	public Iterable<Question> findAllByAccountIdAndStatus(@Param("id") int accountID,@Param("status") int status);
	
	
	@Query(value = "from Question where account.id = :id")
	public Iterable<Question> findAllByAccountId(@Param("id") int accountID);
	
	
	@Query(value = "from Question where subject.id = :sjid")
	public Iterable<Question> findAllBySubjectID(@Param("sjid") int subjectID);
	
	@Query(value = "from Question where subject.id = :sjid and status= :status")
	public Iterable<Question> findAllBySubjectIDAndStatus(@Param("sjid") int subjectID, @Param("status") int status);
	
	@Query(value = "from Question where status= :status")
	public Iterable<Question> findAllByStatus(@Param("status") int status);
	
//	@Query(value = "from Question where subject.id = :subject_id")
//	public Iterable<Question> findAllSubjectSubByCoprrect(@Param("subject_id") int subjectID);
}
