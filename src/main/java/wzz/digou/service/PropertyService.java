package wzz.digou.service;

import wzz.digou.pojo.Property;

import java.util.List;

public interface PropertyService {
    void add(Property c);

    void delete(int id);

    void update(Property c);

    Property get(int id);

    List list(int cid);
}
