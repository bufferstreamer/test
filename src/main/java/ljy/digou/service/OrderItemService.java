/**
 * 模仿天猫整站ssm 教程 为how2j.cn 版权所有
 * 本教程仅用于学习使用，切勿用于非法用途，由此引起一切后果与本站无关
 * 供购买者学习，请勿私自传播，否则自行承担相关法律责任
 */

package ljy.digou.service;

import ljy.digou.pojo.Order;
import ljy.digou.pojo.OrderItem;

import java.util.List;

public interface OrderItemService {


    void add(OrderItem c);

    void delete(int id);

    void update(OrderItem c);

    OrderItem get(int id);

    List list();

    void fill(List<Order> os);

    void fill(Order o);

    int getSaleCount(int pid);

    List<OrderItem> listByUser(int uid);

    List<Integer> getTuijian();

    List<OrderItem> getByoAndu(int uid, int oid);
}
