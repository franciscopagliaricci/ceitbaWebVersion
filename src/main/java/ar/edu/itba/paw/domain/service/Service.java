package ar.edu.itba.paw.domain.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import ar.edu.itba.paw.domain.PersistentEntity;
import ar.edu.itba.paw.domain.enrollment.Enrollment;

@Entity
@Table(name = "services")
public class Service extends PersistentEntity {

	private static final long serialVersionUID = 1458185713348852500L;

	@Column(name = "name", unique = true, nullable = false)
	private String name;
	@Column(name = "value", nullable = false)
	private double value;

	public static enum Status {
		ACTIVE, INACTIVE
	};

	@Enumerated(EnumType.STRING)
	@Column(name = "status", nullable = false)
	private Status status;
	// set value to 0 for infinite service
	@Column(name = "months_duration", nullable = false)
	private int monthsDuration;

	@OneToMany
	private List<Enrollment> enrollments = new ArrayList<Enrollment>();

	Service() {
	}

	// IMPORTANT: if the duration is set to 0, the service is suppossed to be infinite,
	// the enrollments do not end if not cancelled!!!
	public Service(final String name, final Double value, final int monthsDuration) {
		this.name = name;
		this.value = value;
		this.status = Status.ACTIVE;
		this.monthsDuration = monthsDuration;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setValue(double value) {
		this.value = value;
	}

	public void activate() {
		this.status = Status.ACTIVE;
	}

	public void deactivate() {
		this.status = Status.INACTIVE;
		concludeSubscriptions();
	}

	private void concludeSubscriptions() {
		for (Enrollment e : enrollments) {
			e.cancel();
		}
	}

	public void setMonthsDuration(int monthsDuration) {
		this.monthsDuration = monthsDuration;
	}

	public String getName() {
		return name;
	}

	public double getValue() {
		return value;
	}

	public boolean isActive() {
		return status == Status.ACTIVE;
	}

	public Status getStatus() {
		return status;
	}

	public int getMonthsDuration() {
		return monthsDuration;
	}

	public void enroll(Enrollment e) {
		for (Enrollment active : enrollments)
			if (active.getPerson().equals(e.getPerson()) && e.isActive())
				return;
		enrollments.add(e);
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null)
			return false;
		if (!(obj instanceof Service))
			return false;
		Service other = (Service) obj;
		return other.getName() == name;
	}
	
	@Override
	public String toString() {
		return "id: " + getId() + " name: " + name + " value: " + value + " duration: " + monthsDuration + " status: " + status;
	}
}