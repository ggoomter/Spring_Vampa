package com.vam.mapper;

import com.vam.model.UserDTO;

public interface UserMapper {


	/* 회원가입 */
    public void join(UserDTO user);
    
    /* 로그인 */
    public UserDTO login(UserDTO user);
    

}
