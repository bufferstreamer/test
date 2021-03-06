package wzz.digou.service;

import wzz.digou.pojo.Category;
import wzz.digou.pojo.Product;

import java.util.List;

public interface ProductService {
    void add(Product p);

    void delete(int id);

    void update(Product p);

    void updateByID(Product p);

    Product get(int id);

    List list(int cid);

    List<Product> getAll();

    void setFirstProductImage(Product p);

    void fill(List<Category> cs);

    void fill(Category c);

    void fillByRow(List<Category> cs);

    void setSaleAndReviewNumber(Product p);

    void setSaleAndReviewNumber(List<Product> ps);

    List<Product> search(String keyword);

    //推荐最热
    List<Integer> getGouZuiRe();

    //获取用户对商品评分
    void setScore(int userId,Product p);
    //获取用户对商品列表评分
    void setScore(int userId,List<Product> ps);
}
