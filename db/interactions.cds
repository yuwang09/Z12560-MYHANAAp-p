// namespace app.interactions;

using { Country } from '@sap/cds/common';

context app.interactions {
  

type BusinessKey : String(10);
type SDate : DateTime;
type LText : String(1024);


entity Interactions_Header {
  key ID : Integer;
  ITEMS  : Composition of many Interactions_Items on ITEMS.INTHeader = $self;
  PARTNER  : BusinessKey;
  LOG_DATE  : SDate;
  BPCOUNTRY : Country;

};
entity Interactions_Items {

    key INTHeader : association to Interactions_Header;
    key TEXT_ID : BusinessKey;
        LANGU   : String(2);
        LOGTEXT : LText;
};

}

@cds.persistence.exists 
@cds.persistence.calcview 
Entity V_INTERACTION {
key     ID: Integer  @title: 'ID: ID' ; 
        PARTNER: String(10)  @title: 'PARTNER: PARTNER' ; 
        LOG_DATE: String  @title: 'LOG_DATE: LOG_DATE' ; 
        BPCOUNTRY_CODE: String(3)  @title: 'BPCOUNTRY_CODE: BPCOUNTRY_CODE' ; 
        INTHEADER_ID: Integer  @title: 'INTHEADER_ID: INTHEADER_ID' ; 
        TEXT_ID: String(10)  @title: 'TEXT_ID: TEXT_ID' ; 
        LANGU: String(2)  @title: 'LANGU: LANGU' ; 
        LOGTEXT: String(1024)  @title: 'LOGTEXT: LOGTEXT' ; 
}