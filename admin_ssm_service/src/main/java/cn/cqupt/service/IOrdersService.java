package cn.cqupt.service;

import cn.cqupt.domain.Orders;
import org.springframework.core.annotation.Order;

import java.util.List;

public interface IOrdersService {
    public List<Orders> findAll(int page,int size) throws Exception;

    Orders findById(String ordersId) throws Exception;
}
