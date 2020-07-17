package cn.cqupt.dao;

import cn.cqupt.domain.Member;
import cn.cqupt.domain.Orders;
import cn.cqupt.domain.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IOrdersDao {
    @Select("select * from orders")
    @Results(
            {
                    @Result(id=true,property = "id",column = "id"),
                    @Result(property = "orderNum",column = "orderNum"),
                    @Result(property = "orderTime",column = "orderTime"),
                    @Result(property = "orderStatus",column = "orderStatus"),
                    @Result(property = "peopleCount",column = "peopleCount"),
                    @Result(property = "peopleCount",column = "peopleCount"),
                    @Result(property = "payType",column = "payType"),
                    @Result(property = "orderDesc",column = "orderDesc"),
                    @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "cn.cqupt.dao.IProductDao.findById")),
            }
    )
    List<Orders> findAll() throws Exception;

    @Select("select * from orders where id = #{id}")
    @Results(
            {
                    @Result(id=true,property = "id",column = "id"),
                    @Result(property = "orderNum",column = "orderNum"),
                    @Result(property = "orderTime",column = "orderTime"),
                    @Result(property = "orderStatus",column = "orderStatus"),
                    @Result(property = "peopleCount",column = "peopleCount"),
                    @Result(property = "peopleCount",column = "peopleCount"),
                    @Result(property = "payType",column = "payType"),
                    @Result(property = "orderDesc",column = "orderDesc"),
                    @Result(property = "product",column = "productId",javaType = Product.class,one = @One(select = "cn.cqupt.dao.IProductDao.findById")),
                    @Result(property = "member",column = "memberid",javaType = Member.class,one = @One(select = "cn.cqupt.dao.IMemberDao.findById")),
                    @Result(property = "travellers",column = "id",javaType = java.util.List.class,many = @Many(select = "cn.cqupt.dao.ITravellerDao.findByOrdersId")),
            }
    )
    Orders findById(String ordersId);
}
