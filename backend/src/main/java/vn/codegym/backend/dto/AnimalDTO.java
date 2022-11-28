package vn.codegym.backend.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;

public class AnimalDTO implements Validator {
    private Long id;
    @NotEmpty(message = "Mã chuồng không được để trống")
    private String cageId;

    @NotNull
    @JsonProperty
    private boolean isSick;

    @NotNull
    private double weight;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dateIn;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dateOut;

    public AnimalDTO() {
    }


    public String getCageId() {
        return cageId;
    }

    public void setCageId(String cageId) {
        this.cageId = cageId;
    }

    public boolean isSick() {
        return isSick;
    }

    public void setSick(boolean sick) {
        isSick = sick;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public LocalDate getDateIn() {
        return dateIn;
    }

    public void setDateIn(LocalDate dateIn) {
        this.dateIn = dateIn;
    }

    public LocalDate getDateOut() {
        return dateOut;
    }

    public void setDateOut(LocalDate dateOut) {
        this.dateOut = dateOut;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return AnimalDTO.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        AnimalDTO animalDTO = (AnimalDTO) target;
        LocalDate dateIn = animalDTO.getDateIn();
        LocalDate dateOut = animalDTO.getDateOut();
        if(dateOut.compareTo(dateIn) < 0)
        {
            errors.rejectValue("dateOut", "dateOut.lessThan");
        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}

