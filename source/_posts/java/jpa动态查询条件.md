---
title: jpa动态查询条件
tags:
  - java
  - jpa
abbrlink: 4a55ce1d
date: 2022-06-26 21:52:12
---



```java
@Data
@AllArgsConstructor
public class SearchCriteria {
    private String key;
    private Object value;
    private SearchOperation operation;
}

```

```java
public enum SearchOperation {

    GREATER_THAN,
    LESS_THAN,
    GREATER_THAN_EQUAL,
    LESS_THAN_EQUAL,
    NOT_EQUAL,
    EQUAL,
    LIKE,
    LIKE_START,
    LIKE_END,
    IN,
    NOT_IN
}
```

```java

public class Specification<T> implements Specification<T> {
    private List<SearchCriteria> list = new ArrayList<>();

    public void add(SearchCriteria criteria) {
        list.add(criteria);
    }


    @Override
    public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
        List<Predicate> predicates = new ArrayList<>();
        for (SearchCriteria criteria : list) {
            switch (criteria.getOperation()) {
                case GREATER_THAN:
                    predicates.add(builder.greaterThan(root.get(criteria.getKey()), criteria.getValue().toString()));
                    break;
                case LESS_THAN:
                    predicates.add(builder.lessThan(root.get(criteria.getKey()), criteria.getValue().toString()));
                    break;
                case GREATER_THAN_EQUAL:
                    predicates.add(builder.greaterThanOrEqualTo(root.get(criteria.getKey()), criteria.getValue().toString()));
                    break;
                case LESS_THAN_EQUAL:
                    predicates.add(builder.lessThanOrEqualTo(root.get(criteria.getKey()), criteria.getValue().toString()));
                    break;
                case NOT_EQUAL:
                    predicates.add(builder.notEqual(root.get(criteria.getKey()), criteria.getValue()));
                    break;
                case EQUAL:
                    predicates.add(builder.equal(root.get(criteria.getKey()), criteria.getValue()));
                    break;
                case LIKE:
                    predicates.add(builder.like(builder.lower(root.get(criteria.getKey())), "%" + criteria.getValue().toString().toLowerCase() + "%"));
                    break;
                case LIKE_END:
                    predicates.add(builder.like(builder.lower(root.get(criteria.getKey())), criteria.getValue().toString().toLowerCase() + "%"));
                    break;
                case LIKE_START:
                    predicates.add(builder.like(builder.lower(root.get(criteria.getKey())), "%" + criteria.getValue().toString().toLowerCase()));
                    break;
                case IN:
                    predicates.add(builder.in(root.get(criteria.getKey())).value(criteria.getValue()));
                    break;
                case NOT_IN:
                    predicates.add(builder.not(root.get(criteria.getKey())).in(criteria.getValue()));
                    break;
            }
        }
        return builder.and(predicates.toArray(new Predicate[0]));
    }
}

```

```java
    @PostMapping
    ResponseEntity specification(@RequestBody List<SearchCriteria> searchCriteria) {
        UserSpecification<UserEntity> appleSpecification = new UserSpecification();
        searchCriteria.stream().map(
                searchCriterion -> new SearchCriteria(searchCriterion.getKey(),
                        searchCriterion.getValue(),
                        searchCriterion.getOperation())).forEach(appleSpecification::add);
        List<UserEntity> msGenreList = userDao.findAll(appleSpecification);
        msGenreList.forEach(System.out::println);

    return  ResponseEntity.status(HttpStatus.OK).body(msGenreList);
    }
```