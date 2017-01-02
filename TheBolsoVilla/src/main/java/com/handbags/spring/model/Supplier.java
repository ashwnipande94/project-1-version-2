package com.handbags.spring.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class Supplier {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	      int  SupplierId;
		@NotEmpty
    	@Pattern(regexp="^[A-Za-z+]+[0-9+]*$",message="suppliername should start with an alphabet")
		private String SupplierName;
		@Pattern(regexp="^[0-9]*$")
		private String SupplierContact;
		private String SupplierAddress;
		
		public int getSupplierId() {
			return SupplierId;
		}
		public void setSupplierId(int supplierId) {
			SupplierId = supplierId;
		}
		public String getSupplierName() {
			return SupplierName;
		}
		public void setSupplierName(String supplierName) {
			SupplierName = supplierName;
		}
		public String getSupplierContact() {
			return SupplierContact;
		}
		public void setSupplierContact(String supplierContact) {
			SupplierContact = supplierContact;
		}
		public String getSupplierAddress() {
			return SupplierAddress;
		}
		public void setSupplierAddress(String supplierAddress) {
			SupplierAddress = supplierAddress;
		}
		
}
