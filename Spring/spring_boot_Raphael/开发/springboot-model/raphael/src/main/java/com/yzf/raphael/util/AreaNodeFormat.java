package com.yzf.raphael.util;

import com.yzf.raphael.dao.AreaNode;
import com.yzf.raphael.model.DwdDimCommonXzqhM;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author ：xxx
 * @description：TODO
 * @date ：11/5/20 2:18 PM
 */


public class AreaNodeFormat {
    public static List<AreaNode> format(List<DwdDimCommonXzqhM> dwdDimCommonXzqhMList) {
        List<AreaNode> areaNodes = new ArrayList<>();
        for (DwdDimCommonXzqhM dwdDimCommonXzqhM : dwdDimCommonXzqhMList) {
            AreaNode areaNode = new AreaNode(dwdDimCommonXzqhM.getK_sjxzqhid(),
                    dwdDimCommonXzqhM.getK_xzqhid(),
                    dwdDimCommonXzqhM.getK_xzqhmc());
            areaNodes.add(areaNode);
        }

        return buidTree(areaNodes);
    }

    public static List<AreaNode> buidTree(List<AreaNode> list) {
        List<AreaNode> tree = new ArrayList<>();
        for (AreaNode node : list) {
            if (node.getQy_dqbm_f().equals("0") ) {
                tree.add(findChild(node, list));
            }
        }
        return tree;
    }

    public static AreaNode findChild(AreaNode node, List<AreaNode> list) {
        for (AreaNode n : list) {
            if (n.getQy_dqbm_f().equals(node.getValue())) {
                if (node.getChildren() == null) {
                    node.setChildren(new ArrayList<AreaNode>());
                }

                node.getChildren().add(findChild(n, list));
            }
        }
        return node;

    }
}
