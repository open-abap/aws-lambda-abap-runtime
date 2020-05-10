CLASS zcl_handler DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS:
      logic
        RETURNING
          VALUE(rv_text) TYPE string,
      run
        IMPORTING
          event       TYPE string OPTIONAL
        RETURNING
          VALUE(response) TYPE string
        RAISING
          cx_static_check.

ENDCLASS.

CLASS zcl_handler IMPLEMENTATION.

  METHOD logic.

    DATA: lv_text    TYPE string,
          lv_string  TYPE string,
          lt_words   TYPE STANDARD TABLE OF string,
          lt_letters TYPE STANDARD TABLE OF string,
          lv_word    TYPE string.

    lv_string = `serverless is fun`.

    SPLIT lv_string AT | | INTO TABLE lt_words.
    DELETE lt_words WHERE table_line = ''.

    lv_text = |Number of words: { lines( lt_words ) }\n|.

    LOOP AT lt_words INTO lv_word.

      lv_text = |{ lv_text }Number of unique characters in the word: { lv_word } -|.

      CLEAR lt_letters.
      WHILE lv_word <> ''.
        APPEND lv_word(1) TO lt_letters.
        lv_word = lv_word+1.
      ENDWHILE.

      SORT lt_letters.
      DELETE ADJACENT DUPLICATES FROM lt_letters.

      lv_text = |{ lv_text } { lines( lt_letters ) }\n|.

    ENDLOOP.

    rv_text = lv_text.
  ENDMETHOD.

  METHOD run.
    response = |hello world \n{ logic( ) } \n { event }|.

  ENDMETHOD.

ENDCLASS.