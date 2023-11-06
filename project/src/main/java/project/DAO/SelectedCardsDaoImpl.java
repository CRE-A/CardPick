package project.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.DTO.SelectedCardsDto;

import java.util.List;


@Repository
public class SelectedCardsDaoImpl implements SelectedCardsDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "project.DAO.SelectedCardsMapper.";


    @Override
    public List<SelectedCardsDto> select(String id) throws Exception {
        return session.selectList(namespace + "select", id);
    }

    @Override
    public int insert(SelectedCardsDto selectedCardsDto) throws Exception {
        return session.insert(namespace + "insert", selectedCardsDto);
    }

    @Override
    public int delete(SelectedCardsDto selectedCardsDto) throws Exception {
        System.out.println("selectedCardDaoImpl //  selectedCardsDto = " + selectedCardsDto);
        return session.delete(namespace + "delete", selectedCardsDto);
    }

    @Override
    public int deleteAll(String id) throws Exception {
        System.out.println("/CardDaoImpl   /// deleteAll, id =" + id);
        return session.delete(namespace + "deleteAll", id);
    }

    @Override
    public int count(String id) throws Exception {
        return session.selectOne(namespace + "count", id);
    }

    @Override
    public int isSelectedCard(SelectedCardsDto dto) throws Exception {
        return session.selectOne(namespace + "isSelectedCard", dto);
    }

}
