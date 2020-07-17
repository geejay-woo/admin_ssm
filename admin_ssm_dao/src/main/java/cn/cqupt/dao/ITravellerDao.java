package cn.cqupt.dao;

import cn.cqupt.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ITravellerDao {
    @Select("select * from traveller where id in (select travellerId from order_traveller where orderid=#{orderid})")
    public List<Traveller> findByOrdersId(String orderId);
}
