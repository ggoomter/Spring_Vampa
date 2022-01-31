package com.vam.model;

import lombok.Data;

@Data
public class UserDTO {
	
	private String id;
	private String password;
	private String name;
	
	
	@Override
	public String toString() {
		return "UserDTO [id=" + id + ", password=" + password + ", name=" + name + "]";
	}
	
	
}
