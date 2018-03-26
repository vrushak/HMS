package ERPHO;

import java.sql.Date;

public class Order {
private String orderid;
private String orderDate;
private String delivery;
private String author; 
private String productName;
private String supplier;
private String unit;
private String quantity;
private String count;
private String active;
private String stks;
private String up;
private String total1;
private String gtotal;
private String ean;

/*
private String qty[];
private String up[];
private String total[];


public String[] getQty() {
	return qty;
}
public void setQty(String[] qty) {
	this.qty = qty;
}
public String[] getUp() {
	return up;
}
public void setUp(String[] up) {
	this.up = up;
}
public String[] getTotal() {
	return total;
}
public void setTotal(String[] total) {
	this.total = total;
}
*/


public String getTotal1() {
	return total1;
}

public void setTotal1(String total1) {
	this.total1 = total1;
}

public String getEan() {
	return ean;
}

public void setEan(String ean) {
	this.ean = ean;
}

public String getGtotal() {
	return gtotal;
}

public void setGtotal(String gtotal) {
	this.gtotal = gtotal;
}
public String getTotal() {
	return total1;
}
public void setTotal(String total1) {
	this.total1 = total1;
}
public String getUp() {
	return up;
}
public void setUp(String up) {
	this.up = up;
}

public String getStks() {
	return stks;
}
public void setStks(String stks) {
	this.stks = stks;
}
public String getActive() {
	return active;
}
public void setActive(String active) {
	this.active = active;
}
public String getCount() {
	return count;
}
public void setCount(String count) {
	this.count = count;
}
public String getOrderid() {
	return orderid;
}
public void setOrderid(String orderid) {
	this.orderid = orderid;
}
public String getOrderDate() {
	return orderDate;
}
public void setOrderDate(String orderDate) {
	this.orderDate = orderDate;
}
public String getDelivery() {
	return delivery;
}
public void setDelivery(String delivery) {
	this.delivery = delivery;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}

public String getProductName() {
	return productName;
}
public void setProductName(String productName) {
	this.productName = productName;
}
public String getSupplier() {
	return supplier;
}
public void setSupplier(String supplier) {
	this.supplier = supplier;
}
public String getUnit() {
	return unit;
}
public void setUnit(String unit) {
	this.unit = unit;
}
public String getQuantity() {
	return quantity;
}
public void setQuantity(String quantity) {
	this.quantity = quantity;
}

}
