<!DOCTYPE html>
<html lang="en">
	<head id="head">
		<#include "stubs/header.ftl"/>
		<title>Terms and Conditions</title>
	</head>
	<body id="body">

		<#assign link = (auth)?string('/secure/', '')/>

		<div id="navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="${link}/home" class="navbar-brand">Home</a>
				</div>
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="${link}/video/all">Videos</a></li>
						<li><a href="${(auth)?string('/secure/user', '/secure/terms')}">${(auth)?string('Account', 'Login')}</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">More <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="${link}/home#about">About</a></li>
								<li><a href="${link}/home#events">Events</a></li>
								<li><a href="${link}/home#contact">Contact</a></li>
								<li class="divider"></li>
								<li><a href="${link}/donate">Donate</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<#include "stubs/alert.ftl"/>

		<!-- content -->
		<div class="container">
			<h1>Terms and Conditions</h1>
			<p class="lead">Credit</p>
			<p>
				This document was created using a Contractology template available at http://www.freenetlaw.com.
			</p>
			<p class="lead">Introduction</p>
			<p>
				These terms and conditions govern your use of this website; by using this website, you accept these terms
				and conditions in full.  If you disagree with these terms and conditions or any part of these terms and
				conditions, you must not use this website. You must be at least 18 years of age to use this website.  By
				using this website and by agreeing to these terms and conditions, you warrant and represent that you are at
				least 18 years of age.  This website uses cookies.  By using this website and agreeing to these terms and
				conditions, you consent to House on the Rock Family Ministries’ (HOTRFM)  use of cookies in accordance with
				the terms of our privacy policy (see section on cookies).  License to use website:  Unless otherwise stated,
				House on the Rock Family Ministries and/or its licensors own the intellectual property rights in the website
				and material on the website.  Subject to the license below, all these intellectual property rights are
				reserved.  You may view, download for caching purposes only, and print pages from the website for your own
				personal use, subject to the restrictions set out below and elsewhere in these terms and conditions.
			</p>
			<p class="lead">You must not</p>
			<p>
				republish material from this website (including republication on another website); sell, rent or sub-license
				material from the website; show any material from the website in public; without expressed permission.
				reproduce, duplicate, copy or otherwise exploit material on this website for a commercial purpose. edit or
				otherwise modify any material on the website; or redistribute material from this website except for content
				specifically and expressly made available for redistribution. Where content is specifically made available for
				redistribution, it may only be redistributed within your organization.
			</p>
			<p class="lead">Acceptable use</p>
			<p>
				You must not use this website in any way that causes, or may cause, damage to the website or impairment of the
				availability or accessibility of the website; or in any way which is unlawful, illegal, fraudulent or harmful,
				or in connection with any unlawful, illegal, fraudulent or harmful purpose or activity. You must not use this
				website to copy, store, host, transmit, send, use, publish or distribute any material which consists of, or is
				linked to, any spyware, computer virus, Trojan horse, worm, keystroke logger, rootkit or other malicious
				computer software. You must not conduct any systematic or automated data collection activities without HOTRFM’s
				express written consent. You must not use this website to transmit or send unsolicited commercial
				communications. You must not use this website for any purposes related to marketing without HOTRFM’s expressed
				written consent.
			</p>
			<p class="lead">Restricted access</p>
			<p>
				Access to certain areas of this website is restricted.  HOTRFM reserves the right to restrict access to areas
				of this website, or indeed this entire website, at HOTRFM’s discretion.  If HOTRFM provides you with a user ID
				and password to enable you to access restricted areas of this website or other content or services, you must
				ensure that the user ID and password are kept confidential.  We may disable your user ID and password without
				notice or explanation.
			</p>
			<p class="lead">No warranties</p>
			<p>
				This website is provided “as is” without any representations or warranties, express or implied.  HOTRFM makes
				no representations or warranties in relation to this website or the information and materials provided on this
				website.  Without prejudice to the generality of the foregoing paragraph, HOTRFM does not warrant that: this
				website will be constantly available, or available at all; or the information on this website is complete,
				true, accurate or non-misleading.  Nothing on this website constitutes, or is meant to constitute, advice or
				profession counsel of any kind.  If you require advice in relation to any legal, financial or medical matter
				you should consult an appropriate professional.
			</p>
			<p class="lead">Limitations of liability</p>
			<p>
				HOTRFM will not be liable to you (whether under the law of contact, the law of torts or otherwise) in relation
				to the contents of, or use of, or otherwise in connection with, this website: to the extent that the website is
				provided free-of-charge, for any direct loss;  for any indirect, special or consequential loss; or for any
				business losses, loss of revenue, income, profits or anticipated savings, loss of contracts or business
				relationships, loss of reputation or goodwill, or loss or corruption of information or data.  These limitations
				of liability apply even if HOTRFM has been expressly advised of the potential loss.
			</p>
			<p class="lead">Exceptions</p>
			<p>
				Nothing in this website disclaimer will exclude or limit any warranty implied by law that it would be unlawful
				to exclude or limit; and nothing in this website disclaimer will exclude or limit HOTRFM’s liability in respect
				of any:  death or personal injury caused by HOTRFM’s negligence; fraud or fraudulent misrepresentation on the
				part of HOTRFM; or matter which it would be illegal or unlawful for HOTRFM to exclude or limit, or to attempt
				or purport to exclude or limit, its liability.
			</p>
			<p class="lead">Reasonableness</p>
			<p>
				By using this website, you agree that the exclusions and limitations of liability set out in this website
				disclaimer are reasonable.  If you do not think they are reasonable, you must not use this website.
			</p>
			<p class="lead">Other parties</p>
			<p>
				You accept that, as a limited liability entity, HOTRFM has an interest in limiting the personal liability of
				its officers and employees.  You agree that you will not bring any claim personally against HOTRFM’s officers
				or employees in respect of any losses you suffer in connection with the website. Without prejudice to the
				foregoing paragraph, you agree that the limitations of warranties and liability set out in this website
				disclaimer will protect HOTRFM officers, employees, agents, subsidiaries, successors, assigns and
				sub-contractors as well as HOTRFM.
			</p>
			<p class="lead">Unenforceable provisions</p>
			<p>
				If any provision of this website disclaimer is, or is found to be, unenforceable under applicable law, that
				will not affect the enforceability of the other provisions of this website disclaimer.
			</p>
			<p class="lead">Indemnity</p>
			<p>
				You hereby indemnify HOTRFM and undertake to keep HOTRFM indemnified against any losses, damages, costs,
				liabilities and expenses (including without limitation legal expenses and any amounts paid by HOTRFM to a
				third party in settlement of a claim or dispute on the advice of HOTRFM’s legal advisers) incurred or suffered
				by HOTRFM arising out of any breach by you of any provision of these terms and conditions[, or arising out of
				any claim that you have breached any provision of these terms and conditions.
			</p>
			<p class="lead">Breaches of these terms and conditions</p>
			<p>
				Without prejudice to HOTRFM’s other rights under these terms and conditions, if you breach these terms and
				conditions in any way, HOTRFM may take such action as HOTRFM deems appropriate to deal with the breach,
				including suspending your access to the website, prohibiting you from accessing the website, blocking computers
				using your IP address from accessing the website, contacting your internet service provider to request that
				they block your access to the website and/or bringing court proceedings against you.
			</p>
			<p class="lead">Variation</p>
			<p>
				HOTRFM may revise these terms and conditions from time-to-time.  Revised terms and conditions will apply to the
				use of this website from the date of the publication of the revised terms and conditions on this website.
				Please check this page regularly to ensure you are familiar with the current version.
			</p>
			<p class="lead">Assignment</p>
			<p>
				HOTRFM may transfer, sub-contract or otherwise deal with HOTRFM’s rights and/or obligations under these terms
				and conditions without notifying you or obtaining your consent. You may not transfer, sub-contract or otherwise
				deal with your rights and/or obligations under these terms and conditions.
			</p>
			<p class="lead">Severability</p>
			<p>
				If a provision of these terms and conditions is determined by any court or other competent authority to be
				unlawful and/or unenforceable, the other provisions will continue in effect.  If any unlawful and/or
				unenforceable provision would be lawful or enforceable if part of it were deleted, that part will be deemed
				to be deleted, and the rest of the provision will continue in effect.
			</p>

			<p class="lead">Entire agreement</p>
			<p>
				These terms and conditions constitute the entire agreement between you and HOTRFM in relation to your use of
				this website, and supersede all previous agreements in respect of your use of this website.
			</p>
		</div>
		<!-- content -->

		<!-- footer -->
		<#include "stubs/footer.ftl"/>
		<!-- footer -->

		<!-- javascript -->
		<#include "stubs/scripts.ftl"/>
		<!-- javascript -->

	</body>
</html>


