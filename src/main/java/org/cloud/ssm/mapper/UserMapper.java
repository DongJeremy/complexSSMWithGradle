package org.cloud.ssm.mapper;

import org.apache.ibatis.annotations.Param;
import org.cloud.ssm.base.BaseMapper;
import org.cloud.ssm.entity.User;

public interface UserMapper extends BaseMapper<User> {

    User selectUserByUsername(String username);

    void deleteUserRole(long userid, long roleid);

    void addUserRole(long userid, long roleid);

    void deleteUserRoles(long uid);

    int updateStatusByPrimaryKey(@Param("id") Long id, @Param("status") int status);

    void updatePasswordByUserId(@Param("id") Long id, @Param("password") String encryptPassword);

    void updateUserInfoByPrimaryKey(User user);
}
