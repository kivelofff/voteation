package ru.javawebinar.topjava.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;


@MappedSuperclass
@Access(AccessType.FIELD)
public class BaseEntity {

    @Id
    protected Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public BaseEntity() {
    }

    public BaseEntity(Long id) {
        this.id = id;
    }

    @JsonIgnore
    public boolean isNew(){
        return this.id == null;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BaseEntity that = (BaseEntity) o;

        return id != null ? id.equals(that.id) : that.id == null;

    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
