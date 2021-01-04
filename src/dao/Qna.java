package dao;

public class Qna {

	private int qid;
	private int sid;
	private int pid;
	private String qcontent;
	
	
	
	public Qna(int qid, int sid, int pid, String qcontent) {
		super();
		this.qid = qid;
		this.sid = sid;
		this.pid = pid;
		this.qcontent = qcontent;
	}
	public Qna() {
		// TODO Auto-generated constructor stub
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	
	
	
}
