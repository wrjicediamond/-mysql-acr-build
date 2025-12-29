# 使用MySQL 8.0官方镜像作为基础
FROM mysql:8.0

# 设置维护者信息
LABEL maintainer="your-name"
LABEL version="1.0"
LABEL description="MySQL 8.0 with custom configuration for ACR"

# 设置时区为上海
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

# 复制MySQL配置文件
COPY config/my.cnf /etc/mysql/conf.d/

# 复制初始化SQL脚本
COPY sql/init.sql /docker-entrypoint-initdb.d/

# 健康检查配置
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD mysqladmin ping -uroot -p${MYSQL_ROOT_PASSWORD} || exit 1

# 暴露MySQL默认端口
EXPOSE 3306

# 使用官方entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["mysqld"]

