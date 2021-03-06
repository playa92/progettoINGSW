package persistence.dao;

import java.util.List;
import model.CodiceQR;

public interface CodiceQRDao {

	public void save(CodiceQR codice);
	public CodiceQR findByPrimaryKey(String codice);
	public List<CodiceQR> findAll();
	public void update(CodiceQR codice);
	public void delete(CodiceQR codice);
}
