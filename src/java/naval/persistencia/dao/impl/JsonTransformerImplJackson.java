/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package naval.persistencia.dao.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import java.io.IOException;
import naval.persistencia.dao.JsonTransformer;

/**
 *
 * @author Oscar
 */
public class JsonTransformerImplJackson implements JsonTransformer {

    @Override
    public String toJson(Object data) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
            objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
            return objectMapper.writeValueAsString(data);
        } catch (JsonProcessingException ex) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    public Object fromJson(String json, Class clazz) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();

            return objectMapper.readValue(json, clazz);
        } catch (IOException ex) {
            throw new RuntimeException(ex);
        }
    }
}
