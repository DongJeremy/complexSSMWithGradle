package org.cloud.ssm.convert;

import org.cloud.ssm.entity.Department;
import org.dozer.DozerConverter;

public class DepartmentConverter extends DozerConverter<Long, Department> {

    public DepartmentConverter() {
        super(Long.class, Department.class);
    }

    @Override
    public Department convertTo(Long source, Department destination) {
        Department department = new Department(source);
        return department;
    }

    @Override
    public Long convertFrom(Department source, Long destination) {
        return source.getId();
    }

}
