package com.admin.utils;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

@Data
@Accessors(chain = true)
public class PageUtil  implements Serializable {
    /**
     * 当前第几页
     */
    public int   page = 1;

    /**
     * 每页显示记录数
     */
    public int   rows = 20;

    /**
     * 第几条记录起始
     */
    public int   firstPage;

    public int getFirstPage() {
        firstPage = (page - 1) * rows;
        return firstPage;
    }

}
