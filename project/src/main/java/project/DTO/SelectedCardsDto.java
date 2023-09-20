package project.DTO;

import java.util.Date;
import java.util.Objects;

public class SelectedCardsDto {
    private String SelectedCards_pk;
    private String id;
    private String cardNo;
    private Date regdate;

    public SelectedCardsDto() {
    }

    ;

    public SelectedCardsDto(String id, String cardNo) {
        this.id = id;
        this.cardNo = cardNo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public Date getRegdate() {
        return regdate;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SelectedCardsDto that = (SelectedCardsDto) o;
        return Objects.equals(SelectedCards_pk, that.SelectedCards_pk) && Objects.equals(id, that.id) && Objects.equals(cardNo, that.cardNo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(SelectedCards_pk, id, cardNo);
    }

    @Override
    public String toString() {
        return "SelectedCardsDto{" +
                "SelectedCards_pk='" + SelectedCards_pk + '\'' +
                ", id='" + id + '\'' +
                ", cardNo='" + cardNo + '\'' +
                ", regdate=" + regdate +
                '}';
    }
}
