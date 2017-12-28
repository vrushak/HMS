package ERPHO;

import java.util.Arrays;
import java.util.List;

public class TaxB {
private String taxName;
private String percentage;
private String desc;
private String active;
private String[] active1;
private String[] taxName1;

@Override
public String toString() {
	return "TaxB [taxName=" + taxName + ", percentage=" + percentage + ", desc=" + desc + ", active=" + active
			+ ", active1=" + Arrays.toString(active1) + ", taxName1=" + Arrays.toString(taxName1) + "]";
}
public String[] getTaxName1() {
	return taxName1;
}
public void setTaxName1(String[] taxName1) {
	this.taxName1 = taxName1;
}
public String getTaxName() {
	return taxName;
}
public void setTaxName(String taxName) {
	this.taxName = taxName;
}
public String getPercentage() {
	return percentage;
}
public void setPercentage(String percentage) {
	this.percentage = percentage;
}
public String getDesc() {
	return desc;
}
public void setDesc(String desc) {
	this.desc = desc;
}
public String getActive() {
	return active;
}
public void setActive(String active) {
	this.active = active;
}
public String[] getActive1() {
	return active1;
}
public void setActive1(String[] active1) {
	this.active1 = active1;
}
}
