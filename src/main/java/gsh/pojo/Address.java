package gsh.pojo;

import lombok.Data;

@Data
public class Address {

    private String shipping_name;// 物流名称
    private String shipping_code;// 物流单号
    private String receiver_name;// 姓名
    private String receiver_phone;// 手机号

    public Address(String shipping_name, String shipping_code, String receiver_name, String receiver_phone, String receiver_state, String receiver_city, String receiver_district, String receiver_address, String receiver_zip) {
        this.shipping_name = shipping_name;
        this.shipping_code = shipping_code;
        this.receiver_name = receiver_name;
        this.receiver_phone = receiver_phone;
        this.receiver_state = receiver_state;
        this.receiver_city = receiver_city;
        this.receiver_district = receiver_district;
        this.receiver_address = receiver_address;
        this.receiver_zip = receiver_zip;
    }

    private String receiver_state;// 省份
    private String receiver_city;// 城市
    private String receiver_district;// 区县
    private String receiver_address;// 地址
    private String receiver_zip;// 邮政编码

    public Address() {
    }
}
