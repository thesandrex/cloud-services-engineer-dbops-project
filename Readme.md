# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"

### Создание базы данных и пользователя в PostgreSQL

1. Подключаемся к PostgreSQL:
    ```
    psql -U puser -d store
    ```

2. Создаем базу данных:
    ```sql
    CREATE DATABASE store;
    ```

3. Создаем пользователя:
    ```sql
    CREATE ROLE test_user WITH LOGIN PASSWORD 'test_pass';
    ALTER ROLE test_user CREATEDB;
    ```

4. Выдаем права на базу данных:
    ```sql
    GRANT ALL PRIVILEGES ON DATABASE store TO test_user;
    \c store
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO test_user;
    GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO test_user;
    GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO test_user;
    ```


