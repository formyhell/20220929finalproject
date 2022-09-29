package kr.or.ddit.outsourcing.contract.service;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.outsourcing.vo.ContractVO;

/**
 * @author 조채원
 * @since 2022. 8. 25.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                    수정자              		 수정내용
 * --------     --------    ----------------------
 * 2022. 8. 25.     조채원       		 생성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */
public interface ContractService {
	public String getApplicant(String applyId);
	
	public String getProjRegist(String applyId);
	
	public ServiceResult createContract(ContractVO contract);
	
	public ContractVO getContract(String applyId);
	
	public ContractVO getContractwithId(String contractId);
	
	public ContractVO createComSign(ContractVO contract);
	
	public ContractVO createGenSign(ContractVO contract);
	
	public ContractVO concludeContract(String contractId);
}
