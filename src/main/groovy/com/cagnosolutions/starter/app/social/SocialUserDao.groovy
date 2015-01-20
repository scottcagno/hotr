package com.cagnosolutions.starter.app.social
import groovy.transform.CompileStatic
import org.springframework.util.MultiValueMap

/**
 * Created by greg on 1/20/15.
 */

@CompileStatic
interface SocialUserDao {

	List<SocialUser> findByUserId(String userId)

	List<SocialUser> findByUserIdAndProviderId(String userId, String providerId)

	List<SocialUser> findByUserIdAndProviderUserIds(String userId, MultiValueMap<String, String> providerUserIds)

	List<SocialUser> findPrimaryByUserIdAndProviderId(String userId, String providerId)

	SocialUser get(String userId, String providerId, String providerUserId)

	Integer selectMaxRankByUserIdAndProviderId(String userID, String providerId)

	List<String> findUserIdsByProviderIdAndProviderUserId(String providerId, String providerUserId)

	List<String> findUserIdsByProviderIdAndProviderUserIds(String providerId, Set<String> providerUserIds)
}
