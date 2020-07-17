package cn.cqupt.service.impl;

import cn.cqupt.dao.IProductDao;
import cn.cqupt.domain.Product;
import cn.cqupt.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.security.RolesAllowed;
import java.util.List;
@Service
@Transactional
public class ProductService implements IProductService {
    @Autowired
    private IProductDao iProductDao;

    @Override
    public void save(Product product) throws Exception {
        iProductDao.save(product);
    }

    @Override
    @RolesAllowed({"admin"})
    public List<Product> findAll() throws Exception {
        return iProductDao.findAll();
    }
}
