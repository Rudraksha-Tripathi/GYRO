package model;

public class PaymentModes{
	private Integer payment_mode_id;
	private User userId;
	private Boolean cash;
	private Boolean paytm;
	private Boolean googlePay_UPI;
	private Boolean netBanking;

	public PaymentModes(Integer payment_mode_id){
		this.payment_mode_id = payment_mode_id;
	}

	public PaymentModes(User userId){
		this.userId = userId;
	}

	public PaymentModes(){
	
	}
	///////////////////////////////////////////////

	public Integer getPaymentMode_id(){
		return payment_mode_id;
	}

	public void setPaymentMode_id(Integer payment_mode_id){
		this.payment_mode_id = payment_mode_id;
	}

	
}