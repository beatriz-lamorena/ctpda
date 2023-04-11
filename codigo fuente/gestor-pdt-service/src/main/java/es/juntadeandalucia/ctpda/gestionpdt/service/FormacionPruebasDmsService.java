package es.juntadeandalucia.ctpda.gestionpdt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;

import es.juntadeandalucia.ctpda.gestionpdt.model.FormacionPruebasDms;
import es.juntadeandalucia.ctpda.gestionpdt.model.QFormacionPruebasDms;
import es.juntadeandalucia.ctpda.gestionpdt.repository.FormacionPruebasDmsRepository;
import es.juntadeandalucia.ctpda.gestionpdt.service.core.AbstractCRUDService;
import es.juntadeandalucia.ctpda.gestionpdt.service.core.MathsQueryService;
import es.juntadeandalucia.ctpda.gestionpdt.service.core.dto.FiltroDTO;
import es.juntadeandalucia.ctpda.gestionpdt.service.core.exception.BaseException;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FormacionPruebasDmsService extends AbstractCRUDService<FormacionPruebasDms>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Constructor que inyecta bean de calculos matematicos y el resto de beans que hacen falta
	 * */
	public FormacionPruebasDmsService(@Autowired MathsQueryService mathsQueryService, @Autowired FormacionPruebasDmsRepository formacionPruebasDmsRepository){
		super(mathsQueryService, 
				formacionPruebasDmsRepository,
				QFormacionPruebasDms.formacionPruebasDms);
	}
	
	@Override
	public void checkSiPuedoGrabar(FormacionPruebasDms dto) throws BaseException {
		log.debug("Verifico si puedo grabar y elevo excepción sino");
		
	}

	@Override
	public void checkSiPuedoEliminar(Long id) throws BaseException {
		log.debug("Verifico si puedo eliminar y elevo excepción sino");		
	}

/**
 * Filtros custom.
 * Se pueden añadir predicados querydsl a manini, o dejar a nulo.
 * Se añade el filtro 
 * */
	@Override
	protected BooleanBuilder aniadirFiltrosCustom(List<FiltroDTO> filtros) {
		return new BooleanBuilder();
	}

}
