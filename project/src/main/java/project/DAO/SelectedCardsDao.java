package project.DAO;

import project.DTO.SelectedCardsDto;

import java.util.List;

public interface SelectedCardsDao {
    List<SelectedCardsDto> select(String id) throws Exception;

    int insert(SelectedCardsDto selectedCardsDto) throws Exception;

    int delete(SelectedCardsDto selectedCardsDto) throws Exception;

    int deleteAll(String id) throws Exception;

    int count(String id) throws Exception;
}
