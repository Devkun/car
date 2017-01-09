package member.db;

public class MemberDTO {
	private String mem_id;
	private String mem_name;
	private String mem_pass;
	private int mem_phone;
	private String mem_email;
	private int mem_fore;
	
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public int getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(int mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public int getMem_fore() {
		return mem_fore;
	}
	public void setMem_fore(int mem_fore) {
		this.mem_fore = mem_fore;
	}


}
