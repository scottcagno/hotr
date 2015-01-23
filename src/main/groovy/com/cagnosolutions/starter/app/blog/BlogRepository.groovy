package com.cagnosolutions.starter.app.blog

import groovy.transform.CompileStatic
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@CompileStatic
@Repository
interface BlogRepository extends JpaRepository<Blog, Long>{

}