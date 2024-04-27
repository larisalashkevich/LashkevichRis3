package com.lashkevich.bean;

import com.lashkevich.entity.Comment;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;

@Stateless
public class CommentBean {
    @PersistenceContext(unitName = "PERSISTENCE_UNIT")
    private EntityManager entityManager;

    public List<Comment> findAll() {
        return entityManager.createQuery("SELECT p from Comment p", Comment.class).getResultList();
    }

    public Comment findById(Long id) {
        return entityManager.find(Comment.class, id);
    }

    public void deleteById(Long id) {
        entityManager.remove(findById(id));
    }

    public void save(Comment comment) {
        entityManager.persist(comment);
    }

    public void edit(Long id, Comment comment) {
        Comment existingComment = findById(id);
        if (existingComment != null) {
            existingComment.setUsername(comment.getUsername());
            existingComment.setText(comment.getText());
            entityManager.merge(existingComment);
        }
    }
}
