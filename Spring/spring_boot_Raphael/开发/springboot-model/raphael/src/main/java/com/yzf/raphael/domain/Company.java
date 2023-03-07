package com.yzf.raphael.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import org.neo4j.ogm.annotation.*;

import java.util.List;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：10/20/20 7:51 PM
 */
@Data
@NodeEntity(label = "Company")
public class Company {

    @Relationship(type = "Up", direction = Relationship.INCOMING)
    private List<Up> ups;


    @Override
    public String toString() {
        return qymc;
    }

    @Id
    @GeneratedValue
    private Long id;
    @Property(name = "qyid")
    private String qyid;
    @Property(name = "qymc")
    private String qymc;
}
